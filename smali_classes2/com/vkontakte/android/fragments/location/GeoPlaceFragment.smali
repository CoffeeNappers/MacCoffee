.class public Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "GeoPlaceFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;
    }
.end annotation


# static fields
.field private static final KEY_MAP_SAVED_STATE:Ljava/lang/String; = "mapState"


# instance fields
.field mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

.field mCheckInMode:Z

.field mInfo:Landroid/widget/TextView;

.field mMap:Lcom/google/android/gms/maps/MapView;

.field mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field mPhotoURL:Ljava/lang/String;

.field mPlace:Lcom/vkontakte/android/GeoPlace;

.field mStatusText:Ljava/lang/String;

.field mSubtitle:Landroid/widget/TextView;

.field mUserPhotos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

.field mUsersCount:Landroid/widget/TextView;

.field mUsersWrap:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 94
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUserPhotos:Ljava/util/List;

    .line 95
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->setLayout(I)V

    .line 96
    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->showContent()V

    return-void
.end method

.method public static start(Lcom/vkontakte/android/attachments/GeoAttachment;Z)Lcom/vkontakte/android/navigation/Navigator;
    .locals 1
    .param p0, "att"    # Lcom/vkontakte/android/attachments/GeoAttachment;
    .param p1, "checkin"    # Z

    .prologue
    .line 99
    new-instance v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;->point(Lcom/vkontakte/android/attachments/GeoAttachment;)Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;->checkin(Z)Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$Builder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected doLoadData()V
    .locals 2

    .prologue
    .line 237
    new-instance v0, Lcom/vkontakte/android/api/places/PlacesGetInfo;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/places/PlacesGetInfo;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;-><init>(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;Landroid/app/Fragment;)V

    .line 238
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/places/PlacesGetInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 253
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 254
    return-void
.end method

.method invalidate()V
    .locals 7

    .prologue
    const/16 v4, 0x8

    const/4 v5, 0x0

    .line 307
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mSubtitle:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mStatusText:Ljava/lang/String;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v6, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mSubtitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mStatusText:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v4

    :goto_0
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 309
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget-object v0, v3, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    .line 310
    .local v0, "address":Ljava/lang/String;
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mInfo:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    move v3, v5

    :goto_2
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 311
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mInfo:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget v3, v3, Lcom/vkontakte/android/GeoPlace;->checkins:I

    if-lez v3, :cond_5

    const/4 v2, 0x1

    .line 313
    .local v2, "hasUsers":Z
    :goto_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsersWrap:Landroid/view/View;

    if-eqz v2, :cond_6

    :goto_4
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 314
    if-eqz v2, :cond_0

    .line 315
    const/16 v3, 0xa

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUserPhotos:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 316
    .local v1, "count":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->setPadding(I)V

    .line 317
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 318
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsersCount:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget v4, v4, Lcom/vkontakte/android/GeoPlace;->checkins:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPhotoURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 320
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUserPhotos:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->load(Ljava/util/List;)V

    .line 322
    .end local v1    # "count":I
    :cond_0
    return-void

    .end local v0    # "address":Ljava/lang/String;
    .end local v2    # "hasUsers":Z
    :cond_1
    move v3, v5

    .line 308
    goto :goto_0

    .line 309
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v0, v3, Lcom/vkontakte/android/attachments/GeoAttachment;->address:Ljava/lang/String;

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .restart local v0    # "address":Ljava/lang/String;
    :cond_4
    move v3, v4

    .line 310
    goto :goto_2

    :cond_5
    move v2, v5

    .line 312
    goto :goto_3

    .restart local v2    # "hasUsers":Z
    :cond_6
    move v5, v4

    .line 313
    goto :goto_4
.end method

.method synthetic lambda$null$0(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 156
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    const-string/jumbo v2, "https://play.google.com/store/apps/details?id=com.google.android.apps.maps"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 157
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 158
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->startActivity(Landroid/content/Intent;)V

    .line 159
    return-void
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 149
    :sswitch_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "geo:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget-wide v6, v5, Lcom/vkontakte/android/GeoPlace;->lat:D

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget-wide v6, v5, Lcom/vkontakte/android/GeoPlace;->lon:D

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "?z=18&q="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget-wide v6, v5, Lcom/vkontakte/android/GeoPlace;->lat:D

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget-wide v6, v5, Lcom/vkontakte/android/GeoPlace;->lon:D

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 150
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v2

    .line 152
    .local v2, "x":Ljava/lang/Throwable;
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080346

    .line 153
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080347

    .line 154
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080482

    invoke-static {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v5

    .line 155
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080149

    const/4 v5, 0x0

    .line 160
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 161
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 166
    .end local v2    # "x":Ljava/lang/Throwable;
    :sswitch_1
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 167
    .restart local v1    # "intent":Landroid/content/Intent;
    const-string/jumbo v3, "point"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 168
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 173
    .end local v1    # "intent":Landroid/content/Intent;
    :sswitch_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget v3, v3, Lcom/vkontakte/android/GeoPlace;->groupID:I

    if-eqz v3, :cond_0

    .line 174
    new-instance v3, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    iget v4, v4, Lcom/vkontakte/android/GeoPlace;->groupID:I

    neg-int v4, v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 179
    :sswitch_3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 180
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v3, "place_id"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v4, v4, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 181
    const-string/jumbo v3, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080143

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-class v3, Lcom/vkontakte/android/fragments/userlist/CheckinsListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v3, v0, v4}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 145
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100261 -> :sswitch_0
        0x7f1002b1 -> :sswitch_0
        0x7f1002b7 -> :sswitch_1
        0x7f1004b4 -> :sswitch_2
        0x7f1004b5 -> :sswitch_3
    .end sparse-switch
.end method

.method synthetic lambda$onViewCreated$2(Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 6
    .param p1, "map"    # Lcom/google/android/gms/maps/GoogleMap;

    .prologue
    .line 217
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 224
    :goto_0
    return-void

    .line 220
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 221
    invoke-virtual {p1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/UiSettings;->setMyLocationButtonEnabled(Z)V

    .line 222
    new-instance v0, Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;-><init>()V

    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v4, v4, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newCameraPosition(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/maps/GoogleMap;->moveCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    .line 223
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v4, v4, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 122
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->loadData()V

    .line 124
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 104
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 105
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/vkontakte/android/ActivityUtils;->requireGoogleMaps(Landroid/app/Activity;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 106
    const v0, 0x7f0801f9

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 107
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 111
    :goto_0
    return-void

    .line 109
    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "point"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 117
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "checkin"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mCheckInMode:Z

    .line 118
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 232
    const v0, 0x7f0301ab

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 283
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroy()V

    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 286
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 288
    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 274
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onDestroy()V

    .line 278
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    .line 279
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 258
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onPause()V

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onPause()V

    .line 262
    :cond_0
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 304
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 266
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onResume()V

    .line 267
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 270
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 293
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 294
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v1, :cond_0

    .line 295
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 296
    .local v0, "mapState":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/MapView;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 297
    const-string/jumbo v1, "mapState"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 299
    .end local v0    # "mapState":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v11, 0x7f1002b7

    const/4 v10, 0x0

    .line 128
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 129
    const v4, 0x7f0804f5

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->setTitle(I)V

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v4

    const v5, 0x7f02014f

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 131
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    check-cast v4, Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v4}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    const v4, 0x7f100261

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 134
    .local v1, "mapContainer":Landroid/view/ViewGroup;
    const v4, 0x7f100128

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 135
    .local v3, "title":Landroid/widget/TextView;
    const v4, 0x7f1001e8

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 136
    const v4, 0x7f1002b1

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mInfo:Landroid/widget/TextView;

    .line 137
    const v4, 0x7f10019c

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mSubtitle:Landroid/widget/TextView;

    .line 138
    const v4, 0x7f1004b6

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsersCount:Landroid/widget/TextView;

    .line 139
    const v4, 0x7f1004b5

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsersWrap:Landroid/view/View;

    .line 140
    const v4, 0x7f1002b2

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsers:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 142
    const v4, 0x7f1002c6

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, -0x1

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    int-to-float v8, v8

    const/4 v9, 0x1

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->setBackgroundWithViewPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 144
    invoke-static {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)Landroid/view/View$OnClickListener;

    move-result-object v0

    .line 188
    .local v0, "mClickListener":Landroid/view/View$OnClickListener;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/GeoAttachment;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mInfo:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mAttachment:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v5, v5, Lcom/vkontakte/android/attachments/GeoAttachment;->address:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mSubtitle:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mStatusText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->invalidate()V

    .line 193
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mCheckInMode:Z

    if-eqz v4, :cond_1

    .line 194
    invoke-virtual {p1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    :goto_0
    const v4, 0x7f1004b4

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mInfo:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUsersWrap:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "com.google.android.apps.maps"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Global;->isAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v4

    if-nez v4, :cond_0

    .line 204
    new-instance v4, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v6}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    invoke-virtual {v6, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v6

    invoke-direct {v4, p0, v5, v6}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$1;-><init>(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    .line 210
    if-eqz p2, :cond_2

    const-string/jumbo v4, "mapState"

    .line 211
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 212
    .local v2, "mapState":Landroid/os/Bundle;
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/maps/MapView;->onCreate(Landroid/os/Bundle;)V

    .line 214
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 216
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)Lcom/google/android/gms/maps/OnMapReadyCallback;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/gms/maps/MapView;->getMapAsync(Lcom/google/android/gms/maps/OnMapReadyCallback;)V

    .line 226
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    .end local v2    # "mapState":Landroid/os/Bundle;
    :cond_0
    return-void

    .line 196
    :cond_1
    invoke-virtual {p1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 211
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method
