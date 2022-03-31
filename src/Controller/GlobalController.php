<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GlobalController extends AbstractController
{
    #[Route('/', name: 'app_global')]
    public function index(CategoryRepository $repository): Response
    {
        return $this->render('global/index.html.twig', [
            'categories' => $repository->findAll()
        ]);
    }
}
