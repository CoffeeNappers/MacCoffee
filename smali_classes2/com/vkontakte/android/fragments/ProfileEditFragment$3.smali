.class Lcom/vkontakte/android/fragments/ProfileEditFragment$3;
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
    .line 153
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
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
    const/4 v1, 0x0

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 157
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$102(Lcom/vkontakte/android/fragments/ProfileEditFragment;Z)Z

    .line 165
    :goto_0
    return-void

    .line 160
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$202(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 161
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;

    move-result-object v2

    invoke-virtual {v2, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/database/Country;

    .line 162
    .local v0, "c":Lcom/vkontakte/android/data/database/Country;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v2

    iget v3, v0, Lcom/vkontakte/android/data/database/Country;->id:I

    if-lez v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0
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
    .line 171
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
