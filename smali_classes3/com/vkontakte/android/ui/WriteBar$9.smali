.class Lcom/vkontakte/android/ui/WriteBar$9;
.super Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
.source "WriteBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar;->addVideoFile(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$durationFinal:I

.field final synthetic val$progress:Landroid/app/ProgressDialog;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/app/ProgressDialog;Landroid/content/Context;ILandroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 784
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$9;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iput-object p2, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$progress:Landroid/app/ProgressDialog;

    iput-object p3, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$ctx:Landroid/content/Context;

    iput p4, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$durationFinal:I

    iput-object p5, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Ljava/util/ArrayList;)V
    .locals 4
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 799
    .local p1, "newUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 800
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$9;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$durationFinal:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$uri:Landroid/net/Uri;

    invoke-static {v1, v0, v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->access$3800(Lcom/vkontakte/android/ui/WriteBar;Ljava/lang/String;ILandroid/net/Uri;)V

    .line 802
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 803
    return-void
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 793
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$ctx:Landroid/content/Context;

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 794
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 795
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 787
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$ctx:Landroid/content/Context;

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 788
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$9;->val$progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 789
    return-void
.end method
