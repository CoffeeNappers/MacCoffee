.class final Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;
.super Ljava/lang/Object;
.source "LikeBarBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/binder/LikeBarBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LikeLabelFormatter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;,
        Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;
    }
.end annotation


# static fields
.field static final formatUser:Lcom/vkontakte/android/functions/F1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final formatUserDat:Lcom/vkontakte/android/functions/F1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final formatUserFull:Lcom/vkontakte/android/functions/F1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final formatUserFullDat:Lcom/vkontakte/android/functions/F1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F1",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final isFriend:Lcom/vkontakte/android/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/Predicate",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final isMale:Lcom/vkontakte/android/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/Predicate",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final isNotUser:Lcom/vkontakte/android/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/Predicate",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final isUser:Lcom/vkontakte/android/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/Predicate",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field likeFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;

.field repostFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 94
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/Predicate;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isUser:Lcom/vkontakte/android/functions/Predicate;

    .line 95
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$2;->lambdaFactory$()Lcom/vkontakte/android/functions/Predicate;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isNotUser:Lcom/vkontakte/android/functions/Predicate;

    .line 96
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$3;->lambdaFactory$()Lcom/vkontakte/android/functions/Predicate;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isMale:Lcom/vkontakte/android/functions/Predicate;

    .line 97
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$4;->lambdaFactory$()Lcom/vkontakte/android/functions/Predicate;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->isFriend:Lcom/vkontakte/android/functions/Predicate;

    .line 99
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$5;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserDat:Lcom/vkontakte/android/functions/F1;

    .line 100
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$6;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFullDat:Lcom/vkontakte/android/functions/F1;

    .line 101
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$7;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUser:Lcom/vkontakte/android/functions/F1;

    .line 102
    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$$Lambda$8;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->formatUserFull:Lcom/vkontakte/android/functions/F1;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$static$0(Lcom/vkontakte/android/data/LikeInfo;)Z
    .locals 2
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    const/4 v0, 0x1

    .line 94
    iget v1, p0, Lcom/vkontakte/android/data/LikeInfo;->type:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$static$1(Lcom/vkontakte/android/data/LikeInfo;)Z
    .locals 2
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    const/4 v0, 0x1

    .line 95
    iget v1, p0, Lcom/vkontakte/android/data/LikeInfo;->type:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$static$2(Lcom/vkontakte/android/data/LikeInfo;)Z
    .locals 1
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 96
    const-string/jumbo v0, "male"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/LikeInfo;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$static$3(Lcom/vkontakte/android/data/LikeInfo;)Z
    .locals 1
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 97
    const-string/jumbo v0, "friend"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/LikeInfo;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$static$4(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 99
    const-string/jumbo v0, "firstNameDat"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$5(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;
    .locals 2
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "firstNameDat"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "lastNameDat"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$6(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 101
    const-string/jumbo v0, "firstName"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$7(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;
    .locals 2
    .param p0, "i"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "firstName"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "lastName"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method format(IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .param p1, "likeCount"    # I
    .param p2, "repostCount"    # I
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation

        .annotation build Landroid/support/annotation/Size;
            min = 0x1L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 109
    .local p3, "likes":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/LikeInfo;>;"
    if-eqz p1, :cond_1

    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->likeFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->likeFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->likeFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;

    invoke-virtual {v0, p1, p3}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$LikeFormatter;->format(ILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 120
    :goto_0
    return-object v0

    .line 114
    :cond_1
    if-eqz p2, :cond_3

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->repostFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;

    if-nez v0, :cond_2

    .line 116
    new-instance v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->repostFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;

    .line 118
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->repostFormatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;

    invoke-virtual {v0, p2, p3}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter$RepostFormatter;->format(ILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 120
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
