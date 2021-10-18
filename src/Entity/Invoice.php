<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Invoice
 *
 * @ORM\Table(name="invoice", indexes={@ORM\Index(name="I_FK_INVOICE_STATUS", columns={"status_id"})})
 * @ORM\Entity
 */
class Invoice
{
    /**
     * @var int
     *
     * @ORM\Column(name="invoice_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $invoiceId;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="pay_date", type="datetime", nullable=true)
     */
    private $payDate;

    /**
     * @var \Status
     *
     * @ORM\ManyToOne(targetEntity="Status")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     * })
     */
    private $status;

    public function getInvoiceId(): ?int
    {
        return $this->invoiceId;
    }

    public function getPayDate(): ?\DateTimeInterface
    {
        return $this->payDate;
    }

    public function setPayDate(?\DateTimeInterface $payDate): self
    {
        $this->payDate = $payDate;

        return $this;
    }

    public function getStatus(): ?Status
    {
        return $this->status;
    }

    public function setStatus(?Status $status): self
    {
        $this->status = $status;

        return $this;
    }


}
