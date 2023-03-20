#!/bin/bash
# This script can be a starting point to convert
# PLATFORM_RELATIONSHIPS into another environment variable
# Many CMS systems use a DATABASE_URL to connect to the database
# Feel free to use this as inspiration

getRelationshipInfo() {
    RELATIONSHIP_NAME="$1"
    PROPERTY="$2"
    JQ_STR="to_entries[] | select(.key==\"$RELATIONSHIP_NAME\") | .value[].$PROPERTY"
    CMD="echo $PLATFORM_RELATIONSHIPS | base64 -d | jq -r '$JQ_STR'"
    eval $CMD
}


# choose the name of the relationship to parse, feel free to alter this
RELATIONSHIP="db"
DB_DATABASE="main"

# Extract the information we need
DB_TYPE=$(getRelationshipInfo "$RELATIONSHIP" 'scheme')
DB_USERNAME=$(getRelationshipInfo "$RELATIONSHIP" 'username')
DB_HOST=$(getRelationshipInfo "$RELATIONSHIP" 'host')
DB_PASS=$(getRelationshipInfo "$RELATIONSHIP" 'password')
DB_PORT=$(getRelationshipInfo "$RELATIONSHIP" 'port')

# Create your DATABASE_URL variable here
DATABASE_URL="mysql://$DB_USERNAME:$DB_PASS@$DB_HOST:$DB_PORT/$DB_DATABASE"

# So now we have mysql://user:@db_mysql.internal:3306/main
# echo "$DATABASE_URL" #only echo to test since it will expose the credentials