<?php

namespace App\Entity;

use App\Repository\ColorRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ColorRepository::class)]
class Color
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 32)]
    private $label;

    #[ORM\ManyToMany(targetEntity: Article::class, inversedBy: 'colors')]
    private $colorize;

    public function __construct()
    {
        $this->colorize = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLabel(): ?string
    {
        return $this->label;
    }

    public function setLabel(string $label): self
    {
        $this->label = $label;

        return $this;
    }

    /**
     * @return Collection<int, Article>
     */
    public function getColorize(): Collection
    {
        return $this->colorize;
    }

    public function addColorize(Article $colorize): self
    {
        if (!$this->colorize->contains($colorize)) {
            $this->colorize[] = $colorize;
        }

        return $this;
    }

    public function removeColorize(Article $colorize): self
    {
        $this->colorize->removeElement($colorize);

        return $this;
    }
}
