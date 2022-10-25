.class Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 434
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 438
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment;->setData(Ljava/util/List;)V

    .line 439
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 434
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PickerFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
