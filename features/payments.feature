Feature: A store service back-end
  As a Goods or Services provider
  I need a RESTful catalog service
  So that I can keep track of my consumer's payment methods

  Background:
    Given a list of payment methods
      | order_id | customer_id | type        | available | info                                                                                                                                                      |
      | 100      | 1           | credit card | True      | {"info": {"credit_card_number": "123123123", "card_holder_name": "Amir Shirif", "expiration_month": 12, "expiration_year": 2020, "security_code": "123"}} |
      | 101      | 2           | credit card | False     | {"info": {"credit_card_number": "456456546", "card_holder_name": "Alex Crain", "expiration_month": 3, "expiration_year": 2028, "security_code": "987"}}   |
      | 102      | 3           | credit card | True      | {"info": {"credit_card_number": "7896987987", "card_holder_name": "Zheng Jiang", "expiration_month": 1, "expiration_year": 2026, "security_code": "675"}} |
      | 104      | 4           | credit card | False     | {"info": {"credit_card_number": "4389493849", "card_holder_name": "Maoyi Luo", "expiration_month": 1, "expiration_year": 2026, "security_code": "675"}}   |
      | 200      | 1           | paypal      | True      | {"info": {"email": "cool@gmail.com", "phone_number": "(896) 734-6080", "token": "12"}}                                                                    |
      | 201      | 2           | paypal      | True      | {"info": {"email": "awesome@hotmail.com", "phone_number": "(246) 719-6381", "token": "3"}}                                                                |
      | 202      | 3           | paypal      | False     | {"info": {"email": "great@outlook.com", "phone_number": "(292) 536-5570", "token": "1"}}                                                                  |
      | 204      | 4           | paypal      | False     | {"info": {"email": "perfect@icloud.com", "phone_number": "(631) 714-8611", "token": "1"}}                                                                 |

  Scenario: List all the payments
    When I visit the "home page"
    And I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should see the "123123123" in column "credit_card_number" in the display card
    Then I should see the "456456546" in column "credit_card_number" in the display card
    Then I should see the "7896987987" in column "credit_card_number" in the display card
    Then I should see the "4389493849" in column "credit_card_number" in the display card
    Then I should see the "cool@gmail.com" in column "email" in the display card
    Then I should see the "awesome@hotmail.com" in column "email" in the display card
    Then I should see the "great@outlook.com" in column "email" in the display card
    Then I should see the "perfect@icloud.com" in column "email" in the display card

  Scenario: Create a credit card payment method
    When I visit the "home page"
    And I press the "form-title-create" title
    And I set the "customer_id" to "5" in "create" form
    And I set the "order_id" to "303" in "create" form
    And I select "Yes" in the "available" dropdown in "create" form
    And I select "Credit Card" in the "type" dropdown in "create" form
    And I set the "credit_card_number" to "4345792072142100" in "create" form
    And I set the "card_holder_name" to "James Phillips" in "create" form
    And I set the "expiration_month" to "9" in "create" form
    And I set the "expiration_year" to "2023" in "create" form
    And I set the "security_code" to "219" in "create" form
    And I press the "Create" button
    Then I should see the message "Create a new payment successful!"
    When I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should see the "4345792072142100" in column "credit_card_number" in the display card

  Scenario: Create a paypal payment method
    When I visit the "home page"
    And I press the "form-title-create" title
    And I set the "customer_id" to "5" in "create" form
    And I set the "order_id" to "303" in "create" form
    And I select "Yes" in the "available" dropdown in "create" form
    And I select "PayPal" in the "type" dropdown in "create" form
    And I set the "email" to "udydamma-1603@yopmail.com" in "create" form
    And I set the "phone_number" to "(744) 449-7930" in "create" form
    And I set the "token" to "9" in "create" form
    And I press the "Create" button
    Then I should see the message "Create a new payment successful!"
    When I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should see the "udydamma-1603@yopmail.com" in column "email" in the display card

  Scenario: Delete a payment method
    When I visit the "home page"
    And I press the "form-title-delete" title
    And I set the "payment_id" to "3" in "delete" form
    And I press the "Delete" button
    Then I should see the message "Payment 3 has been deleted!"
    When I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should not see the "7896987987" in column "credit_card_number" in the display card

  Scenario: Update a payment method for a credit card
    When I visit the "home page"
    And I press the "form-title-update" title
    And I set the "payment_id" to "1" in "update" form
    And I set the "customer_id" to "1" in "update" form
    And I set the "order_id" to "1" in "update" form
    And I select "Yes" in the "available" dropdown in "update" form
    And I select "Credit Card" in the "type" dropdown in "update" form
    And I set the "credit_card_number" to "1234567890" in "update" form
    And I set the "card_holder_name" to "Zheng Jiang" in "update" form
    And I set the "expiration_month" to "1" in "update" form
    And I set the "expiration_year" to "2026" in "update" form
    And I set the "security_code" to "675" in "update" form
    And I press the "Update" button
    Then I should see the message "Payment 1 has been updated!"
    When I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should see the "1234567890" in column "credit_card_number" in the display card

  Scenario: Update a payment method for PayPal
    When I visit the "home page"
    And I press the "form-title-update" title
    And I set the "payment_id" to "4" in "update" form
    And I set the "customer_id" to "189" in "update" form
    And I set the "order_id" to "1000" in "update" form
    And I select "No" in the "available" dropdown in "update" form
    And I select "PayPal" in the "type" dropdown in "update" form
    And I set the "email" to "abc@nyu.edu" in "update" form
    And I set the "phone_number" to "9897674444" in "update" form
    And I set the "token" to "hereisyourtoken" in "update" form
    And I press the "Update" button
    Then I should see the message "Payment 4 has been updated!"
    When I press the "list_all" button
    Then I should see the message "List all successful!"
    When I press the "expand-all" button
    Then I should see the "abc@nyu.edu" in column "email" in the display card

  Scenario: Query payments by order id
    When I visit the "home Page"
    And I press the "form-title-query" title
    And I set the "order_id" to "100" in "query" form
    And I press the "Query" button
    Then I should see the message "Query successful!"
    When I press the "expand-all" button
    Then I should see the "123123123" in column "credit_card_number" in the display card
    Then I should not see the "456456546" in column "credit_card_number" in the display card

  Scenario: Query payments by customer id, available and type
    When I visit the "home Page"
    And I press the "form-title-query" title
    And I set the "customer_id" to "2" in "query" form
    And I select "Yes" in the "available" dropdown in "query" form
    And I select "PayPal" in the "type" dropdown in "query" form
    And I press the "Query" button
    Then I should see the message "Query successful!"
    When I press the "expand-all" button
    Then I should see the "awesome@hotmail.com" in column "email" in the display card
    Then I should not see the "cool@gmail.com" in column "email" in the display card
    Then I should not see the "great@outlook.com" in column "email" in the display card
    Then I should not see the "perfect@icloud.com" in column "email" in the display card

  Scenario: Toggle a payment method's availability
    When I visit the "home page"
    And I press the "form-title-toggle" title
    And I set the "payment_id" to "1" in "toggle" form
    And I press the "Toggle" button
    Then I should see the message "Payment 1 availability has been toggled!"
    When I press the "form-title-query" title
    When I set the "order_id" to "100" in "query" form
    And I set the "customer_id" to "1" in "query" form
    And I select "No" in the "available" dropdown in "query" form
    And I select "Credit Card" in the "type" dropdown in "query" form
    And I press the "Query" button
    Then I should see the message "Query successful!"
    When I press the "expand-all" button
    Then I should see the "123123123" in column "credit_card_number" in the display card

  Scenario: Read a payment
    When I visit the "home page"
    And I press the "form-title-read" title
    And I set the "payment_id" to "8" in "read" form
    And I press the "Read" button
    And I press the "expand-all" button
    Then I should see the "perfect@icloud.com" in column "email" in the display card
    Then I should not see the "awesome@hotmail.com" in column "email" in the display card
    Then I should not see the "cool@gmail.com" in column "email" in the display card
    Then I should not see the "great@outlook.com" in column "email" in the display card
