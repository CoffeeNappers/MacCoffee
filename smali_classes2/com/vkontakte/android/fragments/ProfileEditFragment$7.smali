.class Lcom/vkontakte/android/fragments/ProfileEditFragment$7;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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
    .line 197
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 200
    invoke-static {p4, p5}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v1

    iget-boolean v0, v1, Lcom/vkontakte/android/Relation;->partner:Z

    .line 201
    .local v0, "show":Z
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v1

    const v4, 0x7f1004e2

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v0, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v1

    const v4, 0x7f1004e3

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 203
    return-void

    :cond_0
    move v1, v3

    .line 201
    goto :goto_0

    :cond_1
    move v2, v3

    .line 202
    goto :goto_1
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
