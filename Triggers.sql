CREATE TABLE employees (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  PRIMARY KEY(id)
);
CREATE TABLE employee_audits (
  id INT GENERATED ALWAYS AS IDENTITY,
  employee_id INT NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  changed_on TIMESTAMP
);
--This function: Runs before an employee’s row is updated. Checks if the last_name has changed (NEW.last_name <> OLD.last_name). If it changed: Inserts the old last name and timestamp into employee_audits.--

CREATE OR REPLACE FUNCTION log_last_name_changes()
RETURNS TRIGGER AS
$$
BEGIN
  IF NEW.last_name <> OLD.last_name THEN
    INSERT INTO employee_audits(employee_id, last_name, changed_on)
    VALUES(OLD.id, OLD.last_name, now());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--This trigger: Is attached to the employees table. Is fired before any UPDATE to a row. Runs the log_last_name_changes() function.--
CREATE TRIGGER last_name_changes
BEFORE UPDATE
ON employees
FOR EACH ROW
EXECUTE PROCEDURE log_last_name_changes();


--How to Drop a Trigger--
Drop last_name_changes ON employees
