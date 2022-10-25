.class Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileDetailsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProfileDetailsViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;"
    }
.end annotation


# instance fields
.field private contact:Landroid/widget/TextView;

.field private content:Landroid/widget/TextView;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private subtitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileDetailsFragment;)V
    .locals 2

    .prologue
    .line 121
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

    .line 122
    const v0, 0x7f0301cd

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->title:Landroid/widget/TextView;

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10019c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->subtitle:Landroid/widget/TextView;

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10000e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->content:Landroid/widget/TextView;

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1000db

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->contact:Landroid/widget/TextView;

    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 128
    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 132
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 138
    :goto_0
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->content:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->content:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->parsedContent:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->content:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 145
    :goto_1
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->subtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 152
    :goto_2
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 158
    :goto_3
    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->contacts:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->contact:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 164
    :goto_4
    return-void

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 143
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->content:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 150
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 156
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    goto :goto_3

    .line 161
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->contact:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->contact:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->contacts:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 116
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;)V

    return-void
.end method

.method public onClick()V
    .locals 4

    .prologue
    .line 174
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "x":Landroid/content/ActivityNotFoundException;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->fallbackIntent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    .line 177
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->fallbackIntent:Landroid/content/Intent;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$ProfileDetailsViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileDetailsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f080435

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
