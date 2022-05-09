<?php

namespace App\Entity;

use App\Repository\NotificationRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: NotificationRepository::class)]
class Notification
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Group::class, inversedBy: 'notifications')]
    #[ORM\JoinColumn(nullable: false)]
    private $team;

    #[ORM\Column(type: 'string', length: 128)]
    private $object;

    #[ORM\Column(type: 'string', length: 2048)]
    private $content;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTeam(): ?Group
    {
        return $this->team;
    }

    public function setTeam(?Group $team): self
    {
        $this->team = $team;

        return $this;
    }

    public function getObject(): ?string
    {
        return $this->object;
    }

    public function setObject(string $object): self
    {
        $this->object = $object;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }
}
