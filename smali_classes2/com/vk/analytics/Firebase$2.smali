.class Lcom/vk/analytics/Firebase$2;
.super Ljava/lang/Object;
.source "Firebase.java"

# interfaces
.implements Lcom/google/firebase/database/ValueEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/analytics/Firebase;->updateDatabase(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/analytics/Firebase;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/analytics/Firebase;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/vk/analytics/Firebase$2;->this$0:Lcom/vk/analytics/Firebase;

    iput-object p2, p0, Lcom/vk/analytics/Firebase$2;->val$event:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancelled(Lcom/google/firebase/database/DatabaseError;)V
    .locals 3
    .param p1, "error"    # Lcom/google/firebase/database/DatabaseError;

    .prologue
    .line 164
    invoke-static {}, Lcom/vk/analytics/Firebase;->access$600()Ljava/lang/String;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "canceled on db error: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/google/firebase/database/DatabaseError;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-object v0, p0, Lcom/vk/analytics/Firebase$2;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$500(Lcom/vk/analytics/Firebase;)V

    .line 166
    return-void

    .line 164
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDataChange(Lcom/google/firebase/database/DataSnapshot;)V
    .locals 3
    .param p1, "dataSnapshot"    # Lcom/google/firebase/database/DataSnapshot;

    .prologue
    .line 157
    iget-object v1, p0, Lcom/vk/analytics/Firebase$2;->this$0:Lcom/vk/analytics/Firebase;

    iget-object v2, p0, Lcom/vk/analytics/Firebase$2;->val$event:Ljava/lang/String;

    const-class v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/firebase/database/DataSnapshot;->getValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v2, v0}, Lcom/vk/analytics/Firebase;->access$400(Lcom/vk/analytics/Firebase;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Lcom/vk/analytics/Firebase$2;->this$0:Lcom/vk/analytics/Firebase;

    iget-object v1, p0, Lcom/vk/analytics/Firebase$2;->val$event:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/analytics/Firebase;->unsubscribe(Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/vk/analytics/Firebase$2;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$500(Lcom/vk/analytics/Firebase;)V

    .line 160
    return-void
.end method
