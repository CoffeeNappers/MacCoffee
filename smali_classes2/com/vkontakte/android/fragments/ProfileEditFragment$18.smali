.class Lcom/vkontakte/android/fragments/ProfileEditFragment$18;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->setUserPhoto(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

.field final synthetic val$photo:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 688
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->val$photo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 691
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->val$photo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->val$photo:Ljava/lang/String;

    const-string/jumbo v2, ".png"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;->val$photo:Ljava/lang/String;

    const-string/jumbo v2, ".gif"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->showUpdatePhotoDlg(Z)V

    .line 692
    return-void

    .line 691
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
