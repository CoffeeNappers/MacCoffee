.class Lcom/vkontakte/android/LinkRedirActivity$17;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->showErrorMessage(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$resId:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1847
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$17;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput p2, p0, Lcom/vkontakte/android/LinkRedirActivity$17;->val$resId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1850
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$17;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/LinkRedirActivity$17;->val$resId:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1851
    return-void
.end method
