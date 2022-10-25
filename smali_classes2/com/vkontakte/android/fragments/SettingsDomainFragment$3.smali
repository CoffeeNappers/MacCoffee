.class Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;
.super Ljava/lang/Object;
.source "SettingsDomainFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsDomainFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 6
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    const/4 v4, 0x0

    .line 133
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$100(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Z

    move-result v0

    .line 134
    .local v0, "needCheck":Z
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$200(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Ljava/lang/Runnable;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 135
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$300(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$200(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 136
    if-nez v0, :cond_0

    .line 137
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1, v4}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$202(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 142
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$500(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 143
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$500(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1, v4}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$502(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 146
    :cond_1
    if-eqz v0, :cond_2

    .line 147
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$300(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$200(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0xfa

    invoke-virtual {v1, v2, v4, v5}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 149
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$602(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Z)Z

    .line 150
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->invalidateOptionsMenu()V

    .line 151
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const v2, -0xae7e48

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$700(Lcom/vkontakte/android/fragments/SettingsDomainFragment;I)V

    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$800(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/TextView;

    move-result-object v1

    const v2, 0x7f0801c2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 153
    return-void

    .line 139
    :cond_3
    if-eqz v0, :cond_0

    .line 140
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    new-instance v2, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/fragments/SettingsDomainFragment$DelayedLoader;-><init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Lcom/vkontakte/android/fragments/SettingsDomainFragment$1;)V

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$202(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 124
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 129
    return-void
.end method
