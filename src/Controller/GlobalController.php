<?php

namespace App\Controller;

use App\Repository\BrandRepository;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GlobalController extends AbstractController
{
    #[Route('/', name: 'app_global')]
    public function index(CategoryRepository $categoryRepository, BrandRepository $brandRepository): Response
    {
        return $this->render('global/index.html.twig', [
            'categories' => $categoryRepository->findBy([], ['id' => 'DESC'], 5),
            'brands' => $brandRepository->findBy([], [], 5),
        ]);
    }
}
