Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 90.00 and stock of 10 exists
    And a product "Milk" with price 10.00 and stock of 0 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

    Scenario: Buy 3 products
        When I buy "Bread" with quantity 2
        And I buy "Jam" with quantity 1
        And I buy "Butter" with quantity 1
        Then total should be 211.00


    Scenario: Buy product more than stock quantity
        When I buy "Bread" with quantity 11
        Then I can't buy out of stock item


    Scenario Outline: Buy one product
        When I buy <product> with quantity <quantity>
        Then total should be <total>
        Examples:
            | product  | quantity |  total  |
            | "Bread"  |     1    |   20.50 |
            | "Jam"    |     2    |  160.00 |
            | "Butter" |     1    |   90.00 |


