# # Understandings
# #
# # The data was created from customer orders where:
# # One invoice connects the customer to multiple invoice items, one or more
# transactions, and one merchant
# # At least one transaction where their credit card is charged.
# If the charge fails, more transactions may be created for that single invoice.
# # One or more invoice items: one for each item that they ordered
# # The transaction references only the invoice
# # The invoice item references an item and an invoice
# # The item is connected to many invoice items and one merchant
# # The merchant is connected to many invoices and many items
# # Prices, as represented in the CSVs, are in cents.
# Anytime you return a revenue total (like in Merchant#revenue) you must return
# a BigDecimal representating dollars and cents (two decimals, rounded to the
# nearest cent).
# #
# # Goals
# #
# # Use tests to drive both the design and implementation of code
# # Use test fixtures instead of actual data when testing
# # Build a complex system of relationships using multiple interacting classes
# # Demonstrate the DRY principle with modules and/or duck typing
# # Separate parsing and data loading logic from business logic
# # Use memoization to improve performance
