.class Lcom/vk/analytics/Firebase$1;
.super Ljava/lang/Object;
.source "Firebase.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/analytics/Firebase;->init(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/analytics/Firebase;

.field final synthetic val$complete:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vk/analytics/Firebase;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vk/analytics/Firebase$1;->this$0:Lcom/vk/analytics/Firebase;

    iput-object p2, p0, Lcom/vk/analytics/Firebase$1;->val$complete:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "task":Lcom/google/android/gms/tasks/Task;, "Lcom/google/android/gms/tasks/Task<Ljava/lang/Void;>;"
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$000(Lcom/vk/analytics/Firebase;)Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->activateFetched()Z

    .line 80
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$100(Lcom/vk/analytics/Firebase;)V

    .line 81
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$200(Lcom/vk/analytics/Firebase;)V

    .line 82
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->this$0:Lcom/vk/analytics/Firebase;

    invoke-static {v0}, Lcom/vk/analytics/Firebase;->access$300(Lcom/vk/analytics/Firebase;)V

    .line 83
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->val$complete:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/vk/analytics/Firebase$1;->val$complete:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 87
    :cond_0
    return-void
.end method
