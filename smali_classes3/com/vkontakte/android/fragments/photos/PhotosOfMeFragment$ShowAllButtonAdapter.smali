.class Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PhotosOfMeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShowAllButtonAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$1;

    .prologue
    .line 162
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 181
    const v0, 0x18894

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 162
    check-cast p1, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;I)V
    .locals 0
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 172
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 162
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 166
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;-><init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)V

    return-object v0
.end method
