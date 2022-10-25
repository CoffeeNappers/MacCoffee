.class Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "CheckInFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlaceHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/GeoPlace;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final mImage:Lcom/vk/imageloader/view/VKImageView;

.field final mInfo:Landroid/widget/TextView;

.field final mSubtitle:Landroid/widget/TextView;

.field final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 558
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .line 559
    const v0, 0x7f0301ac

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 560
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mTitle:Landroid/widget/TextView;

    .line 561
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mSubtitle:Landroid/widget/TextView;

    .line 562
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mInfo:Landroid/widget/TextView;

    .line 563
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    .line 564
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 565
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/GeoPlace;)V
    .locals 4
    .param p1, "place"    # Lcom/vkontakte/android/GeoPlace;

    .prologue
    .line 569
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/GeoPlace;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 570
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/GeoPlace;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 571
    iget v1, p1, Lcom/vkontakte/android/GeoPlace;->id:I

    if-ltz v1, :cond_3

    .line 572
    iget v1, p1, Lcom/vkontakte/android/GeoPlace;->distance:I

    if-lez v1, :cond_2

    .line 573
    invoke-virtual {p1}, Lcom/vkontakte/android/GeoPlace;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 574
    .local v0, "text":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 575
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p1, Lcom/vkontakte/android/GeoPlace;->distance:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0x7f08035e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 576
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/GeoPlace;->setTag(Ljava/lang/Object;)V

    .line 578
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 585
    .end local v0    # "text":Ljava/lang/String;
    :goto_0
    iget-object v1, p1, Lcom/vkontakte/android/GeoPlace;->photo:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 586
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    iget v1, p1, Lcom/vkontakte/android/GeoPlace;->id:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_5

    const v1, 0x7f02023a

    :goto_1
    invoke-virtual {v2, v1}, Lcom/vk/imageloader/view/VKImageView;->setImageResource(I)V

    .line 588
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mInfo:Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/GeoPlace;->checkins:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mInfo:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/GeoPlace;->checkins:I

    if-lez v1, :cond_7

    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 590
    return-void

    .line 580
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 583
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddress:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddress:Ljava/lang/String;

    :goto_3
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_4
    const v1, 0x7f08033d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 586
    :cond_5
    iget v1, p1, Lcom/vkontakte/android/GeoPlace;->id:I

    const/4 v3, -0x2

    if-ne v1, v3, :cond_6

    const v1, 0x7f02023b

    goto :goto_1

    :cond_6
    const v1, 0x7f02016f

    goto :goto_1

    .line 589
    :cond_7
    const/4 v1, 0x4

    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 552
    check-cast p1, Lcom/vkontakte/android/GeoPlace;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->onBind(Lcom/vkontakte/android/GeoPlace;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 594
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget v2, v2, Lcom/vkontakte/android/GeoPlace;->id:I

    packed-switch v2, :pswitch_data_0

    .line 613
    new-instance v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>()V

    .line 614
    .local v0, "att":Lcom/vkontakte/android/attachments/GeoAttachment;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget-wide v2, v2, Lcom/vkontakte/android/GeoPlace;->lat:D

    iput-wide v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    .line 615
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget-wide v2, v2, Lcom/vkontakte/android/GeoPlace;->lon:D

    iput-wide v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    .line 616
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget-object v2, v2, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->address:Ljava/lang/String;

    .line 617
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget v2, v2, Lcom/vkontakte/android/GeoPlace;->id:I

    iput v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    .line 618
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget-object v2, v2, Lcom/vkontakte/android/GeoPlace;->title:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->title:Ljava/lang/String;

    .line 619
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/GeoPlace;

    iget-object v2, v2, Lcom/vkontakte/android/GeoPlace;->photo:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->photo:Ljava/lang/String;

    .line 620
    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->start(Lcom/vkontakte/android/attachments/GeoAttachment;Z)Lcom/vkontakte/android/navigation/Navigator;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const/16 v4, 0x2099

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 624
    .end local v0    # "att":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_0
    :goto_0
    return-void

    .line 596
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_0

    .line 597
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    invoke-direct {v1}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>()V

    .line 598
    .local v1, "point":Lcom/vkontakte/android/attachments/GeoAttachment;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iput-wide v2, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    .line 599
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    iput-wide v2, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    .line 600
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddress:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->address:Ljava/lang/String;

    .line 601
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v5, "point"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 602
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 607
    .end local v1    # "point":Lcom/vkontakte/android/attachments/GeoAttachment;
    :pswitch_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_0

    .line 608
    new-instance v2, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddress:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const/16 v4, 0x209a

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0

    .line 594
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
