.class public final enum Lcom/vkontakte/android/api/models/Notification$Activity;
.super Ljava/lang/Enum;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/models/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Activity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/models/Notification$Activity;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Follow:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Like:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum None:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public static final enum Wall:Lcom/vkontakte/android/api/models/Notification$Activity;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 213
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Follow"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Follow:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 214
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "FriendAccepted"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 215
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Mention"

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 216
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Wall"

    invoke-direct {v0, v1, v6}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Wall:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 217
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Comment"

    invoke-direct {v0, v1, v7}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 218
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Reply"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 219
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Like"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 220
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "Copy"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 221
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "None"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->None:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 222
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    const-string/jumbo v1, "MoneyTransfer"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/models/Notification$Activity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 212
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Activity;->Follow:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Activity;->FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Activity;->Wall:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Activity;->Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Activity;->Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Activity;->None:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$Activity;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 212
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/models/Notification$Activity;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 212
    const-class v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification$Activity;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/models/Notification$Activity;
    .locals 1

    .prologue
    .line 212
    sget-object v0, Lcom/vkontakte/android/api/models/Notification$Activity;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$Activity;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/models/Notification$Activity;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/models/Notification$Activity;

    return-object v0
.end method
