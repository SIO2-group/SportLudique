<?php

namespace App\Controller;

use App\Entity\Brand;
use App\Form\BrandType;
use App\Repository\BrandRepository;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/brand')]
class BrandController extends AbstractController
{
    #[Route('/', name: 'app_brand')]
    public function index(BrandRepository $brandRepository): Response
    {
        return $this->render('brand/index.html.twig', [
            'brands' => $brandRepository->findAll()
        ]);
    }

    #[Route('/{id}', name: 'app_brand_show', methods: ['GET'])]
    public function show(Brand $brand): Response
    {
        return $this->render('brand/show.html.twig', [
            'brand' => $brand,
            'articles' => $brand->getArticles()
        ]);
    }
}
