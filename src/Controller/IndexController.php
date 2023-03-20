<?php

namespace App\Controller;

use App\Repository\CarRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(CarRepository $carRepository): Response
    {

        return $this->render('index/index.html.twig', [
            'cars' => $carRepository->findAll(),
        ]);
    }
}
