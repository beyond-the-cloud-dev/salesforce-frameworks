[More details TBD]

# Unit of Work

The framework that allows you to mange apex DML statements.

## How it works?

Unit Of Work is Salesforce alternative of inline DMLs statement. Framework allows to process database operation in ordered way.

## How to use?

```java
    SObjectUnitOfWork uwo = new SObjectUnitOfWork();

    uow.registerNew(new Account(Name = 'Created by UOW'));

    uow.commitWork();
```
