<?php

namespace App\Controller;

use App\Repository\BrandRepository;
use App\Repository\CategoryRepository;
use App\Repository\PathRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GlobalController extends AbstractController
{
    #[Route('/', name: 'app_global')]
    public function index(CategoryRepository $categoryRepository, PathRepository $pathRepository): Response
    {
        return $this->render('global/index.html.twig', [
            'categories' => $categoryRepository->findBy([], ['id' => 'DESC'], 5),
            'brands' => $pathRepository->findBy([], [], 5),
        ]);
    }
}
