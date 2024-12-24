using UnityEngine;
using System.Collections;

public class AmmoScript : MonoBehaviour
{
    //Initial bullet velocity
    public float bulletVelocity;
    //Initial bullet damage (to be multiplied by the percentage of current bullet velocity to initial)
    public float bulletDamageInitial;
    //Bullet deceleration over time
    public float bulletDamping;
    //Name of the bullet i.e. 9x19
    public string bulletName;
    //Description of the bullet for game immersion purposes
    public string bulletDescription;
    //The ricochet bullet damping value
    public float bulletDampingRicochet;
    //Time delay for bullets to despawn after collision
    [Range(2f, 30f)] public float despawnDelay;

    private Vector3 initialVelocity;
    private Rigidbody rb;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        initialVelocity = transform.forward * bulletVelocity;
        rb.linearVelocity = initialVelocity;
        rb.linearDamping = bulletDamping;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            GameObject targetPlayer = collision.gameObject;
            PlayerStats stats = targetPlayer.GetComponent<PlayerStats>();
            float damage = bulletDamageInitial * ((rb.linearVelocity.magnitude / bulletVelocity) * 100);
            stats.TakeDamage(damage);
        }

        rb.linearDamping = bulletDampingRicochet;
        StartCoroutine(WaitAndDestroy(despawnDelay));

    }

    IEnumerator WaitAndDestroy(float waitTime)
    {
        // Wait for the specified time
        yield return new WaitForSeconds(waitTime);

        // Destroy the game object this script is attached to
        Destroy(gameObject);
    }


}
