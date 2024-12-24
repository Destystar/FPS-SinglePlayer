using UnityEngine;


public class PlayerStats : MonoBehaviour
{
    //Selectable and editable values
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private string[] armourLevel = { "no armour", "2A", "2", "3A", "3", "4" };
    [SerializeField] private int maxArmourDurability = 100;
    [SerializeField] private float maxStamina = 100f;

    //Actual values used in the game
    private float currentHealth;
    private float currentStamina;
    private int armourDurability;


    private void Awake()
    {
        currentHealth = maxHealth;
        currentStamina = maxStamina;
        armourDurability = maxArmourDurability;
    }


    public void TakeDamage(float damage)
    {
        currentHealth -= damage;

        if (currentHealth <= 0)
        {
            Die();
        }
    }

    private void Die()
    {

    }

}
