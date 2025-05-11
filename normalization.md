# Normalization to Third Normal Form (3NF)

## Objective

To ensure the database schema adheres to the principles of Third Normal Form (3NF) by eliminating redundancy and ensuring that all non-key attributes are fully functionally dependent on the primary key.

---

## Step-by-Step Normalization Review

### 1. First Normal Form (1NF)
**Requirements:**
- All attributes must be atomic (no repeating groups or arrays).
- Each record must be unique.

**Compliance Check:**
- All entities contain atomic values.
- Primary keys (`*_id`) ensure uniqueness.

**Schema complies with 1NF**

---

### 2. Second Normal Form (2NF)
**Requirements:**
- Be in 1NF.
- No partial dependency of any column on a composite primary key.

**Compliance Check:**
- All tables use single-column primary keys (UUIDs).
- No partial dependencies exist.

**Schema complies with 2NF**

---

### 3. Third Normal Form (3NF)
**Requirements:**
- Be in 2NF.
- No transitive dependencies (non-key attributes depending on other non-key attributes).

**Normalization Issues Identified:**

#### Potential Issue:
In the `Property` table:
- `host_id` refers to `User.user_id` but `role` of the user (as `host`) is stored in `User`.
- If we store `role = 'host'` to determine which users can be property owners, there’s a **semantic dependency**.

**Resolution:**
This is not a transitive dependency. We ensure that:
- Only users with `role = 'host'` are allowed to be referenced in `Property.host_id`.
- Enforced logically at application level or via a trigger/constraint.

### Other tables:
- All attributes depend on their respective PKs.
- No non-key attribute is transitively dependent on another non-key attribute.

