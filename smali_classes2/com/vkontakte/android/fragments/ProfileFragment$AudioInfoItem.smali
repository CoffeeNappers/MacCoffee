.class Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioInfoItem"
.end annotation


# instance fields
.field public audio:Lcom/vkontakte/android/audio/MusicTrack;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p2, "audio"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 3713
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3714
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    .line 3715
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 3724
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 3729
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 3734
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3719
    const/16 v0, -0x14

    return v0
.end method
