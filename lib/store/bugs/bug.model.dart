class BugModel{  
      String author;
      String category;
      String createdAt;
      String description;
      List<int> file;
      String id;
      String solution;
      String title;
      String userMongodbId; 
    
      BugModel({ 
        this.author,this.category,this.createdAt,this.description,this.file,this.id,this.solution,this.title,this.userMongodbId,
      });
      
      static BugModel fromJson(Map<String,dynamic> json){
        return BugModel( 
            author: json['author'],
            category: json['category'],
            createdAt: json['created_at'],
            description: json['description'],
            file: [],// json['file'].data != null ? json['file'].data : [],
            id: json['id'],
            solution: json['solution'],
            title: json['title'],
            userMongodbId: json['user_mongodb_id'],
        );
      }
      
      Map<String, dynamic> toJson() => { 
            'author': author,
            'category': category,
            'created_at': createdAt,
            'description': description,
            'file': file,
            'id': id,
            'solution': solution,
            'title': title,
            'user_mongodb_id': userMongodbId,
      };
    }