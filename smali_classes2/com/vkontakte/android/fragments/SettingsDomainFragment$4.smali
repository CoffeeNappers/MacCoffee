.class Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SettingsDomainFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsDomainFragment;->checkDomain()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 197
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$100(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Z

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$800(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0801f9

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const v1, -0x30d8da

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$700(Lcom/vkontakte/android/fragments/SettingsDomainFragment;I)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$502(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 202
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$502(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$100(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Z

    .line 183
    iget-boolean v0, p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;->isValid:Z

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$800(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0801c1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const v1, -0xbd5fb9

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$700(Lcom/vkontakte/android/fragments/SettingsDomainFragment;I)V

    .line 190
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;->isValid:Z

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$602(Lcom/vkontakte/android/fragments/SettingsDomainFragment;Z)Z

    .line 191
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->invalidateOptionsMenu()V

    .line 192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;->isValid:Z

    iget-object v2, p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;->suggestions:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$900(Lcom/vkontakte/android/fragments/SettingsDomainFragment;ZLjava/util/List;)V

    .line 193
    return-void

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$800(Lcom/vkontakte/android/fragments/SettingsDomainFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->this$0:Lcom/vkontakte/android/fragments/SettingsDomainFragment;

    const v1, -0x30d8da

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment;->access$700(Lcom/vkontakte/android/fragments/SettingsDomainFragment;I)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 178
    check-cast p1, Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsDomainFragment$4;->success(Lcom/vkontakte/android/api/utils/UtilsCheckScreenName$Result;)V

    return-void
.end method
