#!/bin/bash

amazon-linux-extras install -y nginx1
systemctl enable nginx --now
PermitRootLogin no
