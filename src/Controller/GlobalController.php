<?php

namespace App\Controller;

use App\Repository\BrandRepository;
use App\Repository\CategoryRepository;
use App\Repository\FileRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GlobalController extends AbstractController
{
    #[Route('/', name: 'app_global')]
    public function index(CategoryRepository $categoryRepository, FileRepository $fileRepository): Response
    {
        return $this->render('global/index.html.twig', [
            'categories' => $categoryRepository->findBy([], ['id' => 'DESC'], 5),
            'files' => $fileRepository->findBy([], ['article' => 'ASC'], 5)
        ]);
    }
}
