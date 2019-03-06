package rmuti.labapi.model.service;

import org.springframework.data.jpa.repository.JpaRepository;
import rmuti.labapi.model.table.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}
