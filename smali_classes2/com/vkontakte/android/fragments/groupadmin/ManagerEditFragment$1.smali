.class Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;
.super Ljava/lang/Object;
.source "ManagerEditFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const v4, 0x7f100308

    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$000(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Landroid/view/View;

    move-result-object v0

    const v3, 0x7f100309

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz p2, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$000(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$000(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p2, :cond_2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 111
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 107
    goto :goto_0

    :cond_2
    move v1, v2

    .line 109
    goto :goto_1
.end method
