.class final enum Lio/reactivex/internal/functions/Functions$NaturalComparator;
.super Ljava/lang/Enum;
.source "Functions.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/functions/Functions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "NaturalComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/functions/Functions$NaturalComparator;",
        ">;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/functions/Functions$NaturalComparator;

.field public static final enum INSTANCE:Lio/reactivex/internal/functions/Functions$NaturalComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 482
    new-instance v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;

    const-string/jumbo v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/functions/Functions$NaturalComparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;->INSTANCE:Lio/reactivex/internal/functions/Functions$NaturalComparator;

    .line 481
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/functions/Functions$NaturalComparator;

    sget-object v1, Lio/reactivex/internal/functions/Functions$NaturalComparator;->INSTANCE:Lio/reactivex/internal/functions/Functions$NaturalComparator;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;->$VALUES:[Lio/reactivex/internal/functions/Functions$NaturalComparator;

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
    .line 481
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/functions/Functions$NaturalComparator;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 481
    const-class v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/functions/Functions$NaturalComparator;
    .locals 1

    .prologue
    .line 481
    sget-object v0, Lio/reactivex/internal/functions/Functions$NaturalComparator;->$VALUES:[Lio/reactivex/internal/functions/Functions$NaturalComparator;

    invoke-virtual {v0}, [Lio/reactivex/internal/functions/Functions$NaturalComparator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/functions/Functions$NaturalComparator;

    return-object v0
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 487
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "o1":Ljava/lang/Object;
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
