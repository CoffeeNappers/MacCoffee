.class public final enum Lcom/vkontakte/android/Relation;
.super Ljava/lang/Enum;
.source "Relation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/Relation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/Relation;

.field public static final enum activelySearching:Lcom/vkontakte/android/Relation;

.field public static final enum civilUnion:Lcom/vkontakte/android/Relation;

.field public static final enum complicated:Lcom/vkontakte/android/Relation;

.field public static final enum engaged:Lcom/vkontakte/android/Relation;

.field public static final enum inLove:Lcom/vkontakte/android/Relation;

.field public static final enum married:Lcom/vkontakte/android/Relation;

.field public static final enum none:Lcom/vkontakte/android/Relation;

.field public static final enum relationship:Lcom/vkontakte/android/Relation;

.field public static final enum single:Lcom/vkontakte/android/Relation;


# instance fields
.field public final id:I

.field final nameFemalePartnerRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field final nameFemaleRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field final nameMalePartnerRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field final nameMaleRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field public final partner:Z

.field public final sameGender:Z


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    .line 8
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "none"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x7f0805ac

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZI)V

    sput-object v0, Lcom/vkontakte/android/Relation;->none:Lcom/vkontakte/android/Relation;

    .line 10
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "single"

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x7f0805b2

    const v7, 0x7f0805b1

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->single:Lcom/vkontakte/android/Relation;

    .line 13
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "relationship"

    const/4 v2, 0x2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x1

    const v6, 0x7f0805af

    const v7, 0x7f0805ad

    const v8, 0x7f0805b0

    const v9, 0x7f0805ae

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->relationship:Lcom/vkontakte/android/Relation;

    .line 18
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "engaged"

    const/4 v2, 0x3

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const v6, 0x7f0805a2

    const v7, 0x7f0805a0

    const v8, 0x7f0805a3

    const v9, 0x7f0805a1

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->engaged:Lcom/vkontakte/android/Relation;

    .line 23
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "married"

    const/4 v2, 0x4

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x0

    const v6, 0x7f0805aa

    const v7, 0x7f0805a8

    const v8, 0x7f0805ab

    const v9, 0x7f0805a9

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->married:Lcom/vkontakte/android/Relation;

    .line 28
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "civilUnion"

    const/4 v2, 0x5

    const/16 v3, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    const v6, 0x7f08059c

    const v7, 0x7f08059c

    const v8, 0x7f08059d

    const v9, 0x7f08059d

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->civilUnion:Lcom/vkontakte/android/Relation;

    .line 33
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "complicated"

    const/4 v2, 0x6

    const/4 v3, 0x5

    const/4 v4, 0x1

    const/4 v5, 0x1

    const v6, 0x7f08059e

    const v7, 0x7f08059e

    const v8, 0x7f08059f

    const v9, 0x7f08059f

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->complicated:Lcom/vkontakte/android/Relation;

    .line 38
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "activelySearching"

    const/4 v2, 0x7

    const/4 v3, 0x6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x7f08059b

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZI)V

    sput-object v0, Lcom/vkontakte/android/Relation;->activelySearching:Lcom/vkontakte/android/Relation;

    .line 40
    new-instance v0, Lcom/vkontakte/android/Relation;

    const-string/jumbo v1, "inLove"

    const/16 v2, 0x8

    const/4 v3, 0x7

    const/4 v4, 0x1

    const/4 v5, 0x1

    const v6, 0x7f0805a6

    const v7, 0x7f0805a4

    const v8, 0x7f0805a7

    const v9, 0x7f0805a5

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    sput-object v0, Lcom/vkontakte/android/Relation;->inLove:Lcom/vkontakte/android/Relation;

    .line 6
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/vkontakte/android/Relation;

    const/4 v1, 0x0

    sget-object v2, Lcom/vkontakte/android/Relation;->none:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/vkontakte/android/Relation;->single:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/vkontakte/android/Relation;->relationship:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/vkontakte/android/Relation;->engaged:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/vkontakte/android/Relation;->married:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/Relation;->civilUnion:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/Relation;->complicated:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/Relation;->activelySearching:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/vkontakte/android/Relation;->inLove:Lcom/vkontakte/android/Relation;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/Relation;->$VALUES:[Lcom/vkontakte/android/Relation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZZI)V
    .locals 8
    .param p3, "id"    # I
    .param p4, "partner"    # Z
    .param p5, "sameGender"    # Z
    .param p6, "nameRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZI)V"
        }
    .end annotation

    .prologue
    .line 59
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZII)V

    .line 60
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZZII)V
    .locals 10
    .param p3, "id"    # I
    .param p4, "partner"    # Z
    .param p5, "sameGender"    # Z
    .param p6, "nameMaleRes"    # I
    .param p7, "nameFemaleRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZII)V"
        }
    .end annotation

    .prologue
    .line 63
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/Relation;-><init>(Ljava/lang/String;IIZZIIII)V

    .line 64
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZZIIII)V
    .locals 0
    .param p3, "id"    # I
    .param p4, "partner"    # Z
    .param p5, "sameGender"    # Z
    .param p6, "nameMaleRes"    # I
    .param p7, "nameFemaleRes"    # I
    .param p8, "nameMalePartnerRes"    # I
    .param p9, "nameFemalePartnerRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZIIII)V"
        }
    .end annotation

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 67
    iput p3, p0, Lcom/vkontakte/android/Relation;->id:I

    .line 68
    iput-boolean p4, p0, Lcom/vkontakte/android/Relation;->partner:Z

    .line 69
    iput-boolean p5, p0, Lcom/vkontakte/android/Relation;->sameGender:Z

    .line 70
    iput p6, p0, Lcom/vkontakte/android/Relation;->nameMaleRes:I

    .line 71
    iput p7, p0, Lcom/vkontakte/android/Relation;->nameFemaleRes:I

    .line 72
    iput p8, p0, Lcom/vkontakte/android/Relation;->nameMalePartnerRes:I

    .line 73
    iput p9, p0, Lcom/vkontakte/android/Relation;->nameFemalePartnerRes:I

    .line 74
    return-void
.end method

.method public static getRelationsById(J)Lcom/vkontakte/android/Relation;
    .locals 6
    .param p0, "id"    # J

    .prologue
    .line 85
    invoke-static {}, Lcom/vkontakte/android/Relation;->values()[Lcom/vkontakte/android/Relation;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 86
    .local v0, "relation":Lcom/vkontakte/android/Relation;
    iget v4, v0, Lcom/vkontakte/android/Relation;->id:I

    int-to-long v4, v4

    cmp-long v4, v4, p0

    if-nez v4, :cond_0

    .line 90
    .end local v0    # "relation":Lcom/vkontakte/android/Relation;
    :goto_1
    return-object v0

    .line 85
    .restart local v0    # "relation":Lcom/vkontakte/android/Relation;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 90
    .end local v0    # "relation":Lcom/vkontakte/android/Relation;
    :cond_1
    sget-object v0, Lcom/vkontakte/android/Relation;->none:Lcom/vkontakte/android/Relation;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/Relation;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/vkontakte/android/Relation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Relation;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/Relation;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lcom/vkontakte/android/Relation;->$VALUES:[Lcom/vkontakte/android/Relation;

    invoke-virtual {v0}, [Lcom/vkontakte/android/Relation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/Relation;

    return-object v0
.end method


# virtual methods
.method public getName(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "isMale"    # Z

    .prologue
    .line 77
    if-eqz p2, :cond_0

    iget v0, p0, Lcom/vkontakte/android/Relation;->nameMaleRes:I

    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/Relation;->nameFemaleRes:I

    goto :goto_0
.end method

.method public getName(Landroid/content/Context;ZLjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "isMale"    # Z
    .param p3, "partner"    # Ljava/lang/String;

    .prologue
    .line 81
    if-eqz p2, :cond_0

    iget v0, p0, Lcom/vkontakte/android/Relation;->nameMalePartnerRes:I

    :goto_0
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/Relation;->nameFemalePartnerRes:I

    goto :goto_0
.end method
