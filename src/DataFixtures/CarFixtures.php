<?php

namespace App\DataFixtures;

use App\Entity\Car;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CarFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $car = new Car();
        $car->setName('Audi');
        $car->setColor('blue');
        $manager->persist($car);

        $car = new Car();
        $car->setName('VW');
        $car->setColor('red');
        $manager->persist($car);

        $car = new Car();
        $car->setName('Bentley');
        $manager->persist($car);

        $manager->flush();
    }
}
