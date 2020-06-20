package pl.coderslab.agreementgenerator.transaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    List<Transaction> findTransactionByClientId(Long id);
    @Query("select t from Transaction t  join Client c on t.client.id = c.id where c.user.id = ?1")
    List<Transaction> findTransactionsForUser(Long id);
}

