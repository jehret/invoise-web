package com.mycompany.invoise.invoiseweb.controller;

import com.mycompany.invoise.core.entity.customer.Address;
import com.mycompany.invoise.core.entity.customer.Customer;
import com.mycompany.invoise.core.entity.invoice.Invoice;

import com.mycompany.invoise.invoice.service.InvoiceServiceInterface;
import com.mycompany.invoise.invoiseweb.form.InvoiceForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/invoice")
public class InvoiceControllerWeb {

    @Autowired
    private InvoiceServiceInterface invoiceService;

    public InvoiceServiceInterface getInvoiceService() {
        return invoiceService;
    }

    public void setInvoiceService(InvoiceServiceInterface invoiceService) {
        this.invoiceService = invoiceService;
    }

    @PostMapping("/create")
    public String createInvoice(@Valid @ModelAttribute InvoiceForm invoiceForm, BindingResult results){
        //vous pourriez même supprimer l'annotation @ModelAttribute si vous ne comptez
        //pas donner un identifiant personnalisé au backing bean
        if (results.hasErrors()){
            return "invoice-create-form";
        }
        Invoice invoice = new Invoice();
        Customer customer=new Customer(invoiceForm.getCustomerName());
        invoice.setCustomer(customer);
        Address address=new Address(invoiceForm.getStreetName(),invoiceForm.getStreetNumber(),invoiceForm.getCity(),invoiceForm.getZipCode(),invoiceForm.getCountry());
        customer.setAddress(address);
        invoice.setOrderNumber(invoiceForm.getOrderNumber());
        invoiceService.createInvoice(invoice);
        return "invoice-created";
    }

    @GetMapping("/home")
    public String displayHome(Model model){
        System.out.println("La méthode display Home a été invoquée");
        return "invoice-home";
    }

    /*@GetMapping("/{id}")
    public String displayInvoice(@PathVariable("id") String number, Model model){
        System.out.println("La méthode displayInvoice a été invoquée");

        model.addAttribute("invoice",invoiceService.getInvoiceByNumber(number));
        //List<Invoice> invoices=invoiceService.getInvoiceList();
        return "invoice-details";
    }*/

    @GetMapping("/create-form")
    public String displayInvoiceCreateForm(@ModelAttribute InvoiceForm invoice){
        //vous pourriez même supprimer l'annotation @ModelAttribute si vous ne comptez
        //pas donner un identifiant personnalisé au backing bean
        return "invoice-create-form";
    }


}
