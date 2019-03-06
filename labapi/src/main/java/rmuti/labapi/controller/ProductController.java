package rmuti.labapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import rmuti.labapi.model.bean.APIResponse;
import rmuti.labapi.model.service.ProductRepository;
import rmuti.labapi.model.table.Product;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @PostMapping(value = "/save")
    public Object save(Product product) {
        APIResponse res = new APIResponse();
        productRepository.save(product);
        return res;
    }

    @PostMapping("/list")
    public Object list() {
        APIResponse res = new APIResponse();
        res.setData(productRepository.findAll());
        return res;
    }
}
