# Cloud-Native Media Automation Pipeline

A containerized, high-performance media acquisition and streaming system deployed on **Oracle Cloud Infrastructure (OCI)** using an ARM-based Ampere A1 instance.

## 🏗️ System Architecture
The pipeline is designed to handle high-definition media with a **zero-local-disk footprint**, utilizing cloud-native storage bridging.

- **Compute:** Oracle Cloud (4 OCPU, 24GB RAM).
- **Storage Gateway:** Rclone FUSE mount providing a virtual filesystem bridge to a 2TB Google Drive.
- **Orchestration:** Docker Compose for microservice isolation.
- **Streaming Engine:** Jellyfin Media Server with optimized VFS caching for seamless bitrate playback.

## 🚀 Key Technical Features
- **Automated Offloading:** Implemented a "Mirror-to-Cloud" logic where the Telegram bot downloads directly to a FUSE-mounted directory, triggering an immediate cloud upload and keeping VPS storage clear.
- **VFS Performance Tuning:** Configured `--vfs-cache-mode full` to enable high-speed seeking and metadata scraping on remote cloud-hosted files.
- **Service Persistence:** Includes Bash automation for mount health-checks and Docker restart policies to ensure 99.9% uptime.

## 🛠️ Repository Structure
- `docker-compose.yml`: Master orchestration file for Bot and Jellyfin services.
- `/scripts/mount_drive.sh`: Automation script to ensure cloud storage persistence.
- `/scripts/clean_ghost.sh`: Storage optimization script to manage temporary local cache.
