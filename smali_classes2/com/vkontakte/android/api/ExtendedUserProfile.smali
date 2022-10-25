.class public Lcom/vkontakte/android/api/ExtendedUserProfile;
.super Ljava/lang/Object;
.source "ExtendedUserProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$Link;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$University;,
        Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    }
.end annotation


# static fields
.field public static final ACCESS_CLOSED:I = 0x1

.field public static final ACCESS_OPEN:I = 0x0

.field public static final ACCESS_PRIVATE:I = 0x2

.field public static final FRIEND_STATUS_FRIENDS:I = 0x3

.field public static final FRIEND_STATUS_NONE:I = 0x0

.field public static final FRIEND_STATUS_RECV_REQUEST:I = 0x2

.field public static final FRIEND_STATUS_SENT_REQUEST:I = 0x1

.field public static final GROUP_STATUS_DECLINED_INVITE:I = 0x3

.field public static final GROUP_STATUS_INVITED:I = 0x5

.field public static final GROUP_STATUS_MEMBER:I = 0x1

.field public static final GROUP_STATUS_NONE:I = 0x0

.field public static final GROUP_STATUS_NOT_SURE:I = 0x2

.field public static final GROUP_STATUS_SENT_REQUEST:I = 0x4

.field public static final MAIN_SECTION_AUDIO:I = 0x3

.field public static final MAIN_SECTION_BOARD:I = 0x2

.field public static final MAIN_SECTION_MARKET:I = 0x5

.field public static final MAIN_SECTION_NONE:I = 0x0

.field public static final MAIN_SECTION_PHOTOS:I = 0x1

.field public static final MAIN_SECTION_STORIES:I = 0x6

.field public static final MAIN_SECTION_VIDEO:I = 0x4

.field public static final TYPE_EVENT:I = 0x1

.field public static final TYPE_GROUP:I = 0x0

.field public static final TYPE_PUBLIC:I = 0x2


# instance fields
.field public about:Ljava/lang/String;

.field public activities:Ljava/lang/String;

.field public activity:Ljava/lang/String;

.field public adminLevel:I

.field public alcohol:I

.field public allPhotosAreHidden:Z

.field public audioStatus:Lcom/vkontakte/android/audio/MusicTrack;

.field public audios:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public bDay:I

.field public bMonth:I

.field public bYear:I

.field public ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

.field public bigPhoto:Ljava/lang/String;

.field public blacklisted:Z

.field public books:Ljava/lang/String;

.field public buttonAppId:I

.field public buttonTitle:Ljava/lang/String;

.field public canCall:Z

.field public canPost:Z

.field public canSeeAllPosts:Z

.field public canSendFriendRequest:Z

.field public canUploadVideo:Z

.field public canWrite:Z

.field public career:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;",
            ">;"
        }
    .end annotation
.end field

.field public city:Ljava/lang/String;

.field public contacts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;",
            ">;"
        }
    .end annotation
.end field

.field public counters:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public country:Ljava/lang/String;

.field public coverPhoto:Lcom/vkontakte/android/Photo;

.field public deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

.field public displayFields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public docs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;"
        }
    .end annotation
.end field

.field public eventEndTime:I

.field public eventStartTime:I

.field public facebookId:J

.field public facebookName:Ljava/lang/String;

.field public firstNameAcc:Ljava/lang/String;

.field public firstNameDat:Ljava/lang/String;

.field public firstNameGen:Ljava/lang/String;

.field public firstNameIns:Ljava/lang/String;

.field public friendStatus:I

.field public friends:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public games:Ljava/lang/String;

.field public gifts:Lcom/vkontakte/android/data/VKList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/models/GiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public goods:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/data/Good;",
            ">;"
        }
    .end annotation
.end field

.field public groupAccess:I

.field public groupType:I

.field public groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private hasCover:Z

.field public hasPhoto:Z

.field public homePhone:Ljava/lang/String;

.field public hometown:Ljava/lang/String;

.field public infoLine:Ljava/lang/String;

.field public inspiredBy:Ljava/lang/String;

.field public instagram:Ljava/lang/String;

.field public interests:Ljava/lang/String;

.field public invitedBy:Lcom/vkontakte/android/UserProfile;

.field public isFavorite:Z

.field public isHiddenFromFeed:Z

.field public isLiveEnabled:Z

.field public isLiveSubscribed:Z

.field public isSubscribed:Z

.field public langs:Ljava/lang/String;

.field public lastNameAcc:Ljava/lang/String;

.field public lastNameDat:Ljava/lang/String;

.field public lastNameGen:Ljava/lang/String;

.field public lastNameIns:Ljava/lang/String;

.field public lastSeen:I

.field public lastSeenMobile:Z

.field public lat:D

.field public lifeMain:I

.field public links:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/ExtendedUserProfile$Link;",
            ">;"
        }
    .end annotation
.end field

.field public livejournal:Ljava/lang/String;

.field public lon:D

.field public mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

.field public mainSection:I

.field public marketMainAlbumId:I

.field public marketWiki:Lcom/vkontakte/android/data/Wiki;

.field public mobilePhone:Ljava/lang/String;

.field public movies:Ljava/lang/String;

.field public music:Ljava/lang/String;

.field public peopleMain:I

.field public photo:Lcom/vkontakte/android/Photo;

.field public photoRect:Landroid/graphics/RectF;

.field public photos:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field

.field public playlists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field public political:I

.field public postponedCount:I

.field public profile:Lcom/vkontakte/android/UserProfile;

.field public quotations:Ljava/lang/String;

.field public relation:I

.field public relationPartner:I

.field public relationPartnerName:Ljava/lang/String;

.field public relativesChild:[Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public relativesGrandchild:[Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public relativesGrandparent:[Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public relativesParents:[Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public relativesSibling:[Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public religion:Ljava/lang/String;

.field public schools:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/ExtendedUserProfile$School;",
            ">;"
        }
    .end annotation
.end field

.field public screenName:Ljava/lang/String;

.field public showAllPosts:Z

.field public skype:Ljava/lang/String;

.field public smoking:I

.field public storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

.field public subscriptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public suggestedCount:I

.field public topics:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/BoardTopic;",
            ">;"
        }
    .end annotation
.end field

.field public tv:Ljava/lang/String;

.field public twitter:Ljava/lang/String;

.field public universities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/ExtendedUserProfile$University;",
            ">;"
        }
    .end annotation
.end field

.field public verified:Z

.field public videos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;"
        }
    .end annotation
.end field

.field public website:Ljava/lang/String;

.field public widget:Lcom/vkontakte/android/api/widget/Widget;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover:Z

    .line 73
    iput-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    .line 75
    iput-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    .line 77
    iput-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    .line 79
    iput-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    .line 81
    iput-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->marketMainAlbumId:I

    return-void
.end method


# virtual methods
.method public getCounter(Ljava/lang/String;)I
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 175
    const-string/jumbo v1, "stories"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 176
    invoke-virtual {p0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasValidStories()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v1, v1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoriesContainer;

    iget-object v0, v0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 185
    :cond_0
    :goto_0
    return v0

    .line 182
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public hasCounter(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 167
    const-string/jumbo v0, "stories"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasValidStories()Z

    move-result v0

    .line 170
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hasCover()Z
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasValidStories()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    .line 163
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public hasWidget()Z
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->widget:Lcom/vkontakte/android/api/widget/Widget;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDeactivated()Z
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setHasCover(Z)V
    .locals 0
    .param p1, "hasCover"    # Z

    .prologue
    .line 249
    iput-boolean p1, p0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover:Z

    .line 250
    return-void
.end method
