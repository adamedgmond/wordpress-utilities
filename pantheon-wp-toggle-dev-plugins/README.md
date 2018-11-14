# Toggle Developer Plugins on WordPress Sites on Pantheon #

This example will show how you can automatically activate and deactivate plugins based on environment on deploy on Pantheon.  This will ease development and potentially improve performance on Live.

## Instructions ##

Setting up this example is easy:

1. Add the wp-toggle_dev-plugins.php to the `private/scripts` directory of your code repository.
2. Add a Quicksilver operation to your `pantheon.yml` to fire the script a deploy.
3. Test a deploy out!

Optionally, you may want to use the `terminus workflow:watch` command to get immediate debugging feedback.

### Example `pantheon.yml` ###

Here's an example of what your `pantheon.yml` would look like if this were the only Quicksilver operation you wanted to use:

```yaml

api_version: 1

workflows:
  deploy:
    after:
      # Toggle developer plugins
      - type: webphp
        description: Toggle developer plugins
        script: private/scripts/wp-toggle-dev-plugins.php
  sync_code:
    after:
      # Toggle developer plugins
      - type: webphp
        description: Toggle developer plugins
        script: private/scripts/wp-toggle-dev-plugins.php
  clone_database:
    after:
      # Toggle developer plugins
      - type: webphp
        description: Toggle developer plugins
        script: private/scripts/wp-toggle-dev-plugins.php
```
