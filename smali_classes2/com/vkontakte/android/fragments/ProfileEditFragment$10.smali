.class Lcom/vkontakte/android/fragments/ProfileEditFragment$10;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/CitySelectFragment$CityCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->selectCity()V
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
    .line 276
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Lcom/vkontakte/android/data/database/City;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/data/database/City;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget v1, p1, Lcom/vkontakte/android/data/database/City;->id:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$202(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$200(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v0

    if-lez v0, :cond_0

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/data/database/City;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public bridge synthetic onItemSelected(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 276
    check-cast p1, Lcom/vkontakte/android/data/database/City;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;->onItemSelected(Lcom/vkontakte/android/data/database/City;)V

    return-void
.end method
