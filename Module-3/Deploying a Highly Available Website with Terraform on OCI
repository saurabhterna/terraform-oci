# Deploying a Highly Available Website with Terraform on Oracle Cloud Infrastructure (OCI)

## Introduction to High Availability

High Availability (HA) refers to designing a system or infrastructure in such a way that it remains operational and accessible even in the face of hardware failures, software failures, and other disruptions. The goal is to minimize downtime and ensure that users can access the system without interruptions.

In the context of web applications, high availability is achieved by distributing traffic across multiple instances of the application to ensure redundancy and fault tolerance. Load balancers play a crucial role in achieving high availability by distributing incoming traffic across multiple backend instances, thus ensuring that no single point of failure exists.

## Using Load Balancers in OCI for High Availability

Oracle Cloud Infrastructure (OCI) provides Load Balancing services that help distribute incoming traffic across multiple backend compute instances. The load balancer monitors the health of backend instances and automatically routes traffic to healthy instances, ensuring that the application remains available even if some instances fail.

## Prerequisites

- An Oracle Cloud Infrastructure (OCI) account
- Terraform installed on your local machine
- Basic understanding of OCI concepts, such as VCN, subnets, compute instances, and load balancers

## Deployment Steps

### Step 1: Configure `provider.tf` file

Create a file named `provider.tf` and configure the OCI provider with your tenancy, user, and key information.

### Step 2: Configure VCN and Subnets

1. Create a Virtual Cloud Network (VCN).
2. Create two subnets: one for web servers and another for the load balancer.

### Step 3: Provision Compute Instances

1. Define a compute instance configuration using Terraform.
2. Use the defined configuration to provision two compute instances in the "web server" subnet.

### Step 4: Create and Configure Load Balancer

1. Define a load balancer configuration using Terraform.
2. Specify backend sets, health checks, and listeners in the load balancer configuration.
3. Provision the load balancer using the defined configuration.

### Step 5: Test the Deployment

1. Access the public IP address or DNS name of the load balancer to reach the website.
2. Observe that the traffic is being evenly distributed among the web server instances.
3. Manually terminate one of the web server instances and verify that the load balancer automatically routes traffic to the healthy instance.

## Conclusion

By following these steps, you can deploy a highly available website on Oracle Cloud Infrastructure using Terraform. The use of load balancers ensures that your application remains accessible even in the face of failures, providing a seamless experience to your users. Remember to adapt the steps according to your specific requirements and configurations.
