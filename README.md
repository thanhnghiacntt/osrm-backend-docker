# Dockerfile cho osrm-backend
Nội dung này được build từ dự án [osrm-backend](https://github.com/Project-OSRM/osrm-backend).
Mã nguồn mở từ (OSRMS)Docker Image [\[Docker Hub\]](https://hub.docker.com/r/thanhnghiacntt/osrm-backend-docker/)

## Cài đặt

1. Cài đặt docker trước tham khảo[Docker](https://www.docker.com/)

2. Cài đặt (optional).

  Pull automated build from Docker Hub:
  ```
  $ docker pull thanhnghiacntt/osrm-backend-docker
  ```
  or build from GitHub:
  ```
  $ docker build -t="osrm-backend-docker" github.com/thanhnghiacntt/osrm-backend-docker
  ```
  or you can clone & build:  
  ```
  $ git clone https://github.com/thanhnghiacntt/osrm-backend-docker.git  
  $ docker build -t="osrm-backend-docker" osrm-backend-docker/
  ```

## Usage
Run như sau:  
```
docker run -d -p 5000:5000 osrm-backend-docker:latest osrm label "http://your/path/to/data.osm.pbf"
```  

Ví dụ:
```
docker run -d -p 5000:5000 -name osrm-api-running osrm-backend-docker:latest osrm VietNam "https://download.geofabrik.de/asia/vietnam-latest.osm.pbf"
```  
Đợi vài phút cho nó chạy xong(tùy phụ thuộc vào dung lượng file .pbf)

Giải thích:  
- `-d` - Chạy ngầm và in container ID của docker 
- `-p 5000:5000` - Port để chạy
- `osrm` - Đi đến tiệp script, w/o osrm keyword
- `label` - Tên nhãn của dữ liệu osrm
- `url` - Lin đến osm data dạng PBF

## Kiểm tra
```
docker ps -a
```  

Nếu có hiển thị dòng docker đang chạy với port 5000 là Ok.
