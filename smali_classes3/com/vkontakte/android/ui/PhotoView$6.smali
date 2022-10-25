.class Lcom/vkontakte/android/ui/PhotoView$6;
.super Ljava/lang/Object;
.source "PhotoView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/PhotoView;->postSwitch(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/PhotoView;

.field final synthetic val$fwd:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/PhotoView;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/PhotoView;

    .prologue
    .line 1080
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoView$6;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iput-boolean p2, p0, Lcom/vkontakte/android/ui/PhotoView$6;->val$fwd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1082
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$6;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->access$3202(Lcom/vkontakte/android/ui/PhotoView;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 1083
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$6;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoView$6;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/PhotoView;->access$1102(Lcom/vkontakte/android/ui/PhotoView;F)F

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->access$702(Lcom/vkontakte/android/ui/PhotoView;F)F

    .line 1084
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoView$6;->this$0:Lcom/vkontakte/android/ui/PhotoView;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/PhotoView$6;->val$fwd:Z

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->access$3300(Lcom/vkontakte/android/ui/PhotoView;Z)V

    .line 1085
    return-void
.end method
