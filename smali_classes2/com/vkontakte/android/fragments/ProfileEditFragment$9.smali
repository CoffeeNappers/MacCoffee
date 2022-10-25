.class Lcom/vkontakte/android/fragments/ProfileEditFragment$9;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 221
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 222
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 223
    const-string/jumbo v1, "relation"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 224
    const-string/jumbo v1, "no_online"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 225
    const-string/jumbo v1, "my_gender"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 226
    const-string/jumbo v1, "show_same_gender"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1100(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemId()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/Relation;->sameGender:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 227
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const/16 v3, 0x65

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 228
    return-void
.end method
