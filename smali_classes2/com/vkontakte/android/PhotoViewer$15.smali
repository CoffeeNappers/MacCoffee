.class Lcom/vkontakte/android/PhotoViewer$15;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 812
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$15;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 815
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$15;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0805dd

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 816
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 812
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer$15;->success(Ljava/lang/Integer;)V

    return-void
.end method
