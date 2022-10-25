.class public final enum Lcom/google/android/gms/internal/zzalh$zza;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzalh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/gms/internal/zzalh$zza;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic bhA:[Lcom/google/android/gms/internal/zzalh$zza;

.field public static final enum bhv:Lcom/google/android/gms/internal/zzalh$zza;

.field public static final enum bhw:Lcom/google/android/gms/internal/zzalh$zza;

.field public static final enum bhx:Lcom/google/android/gms/internal/zzalh$zza;

.field public static final enum bhy:Lcom/google/android/gms/internal/zzalh$zza;

.field public static final enum bhz:Lcom/google/android/gms/internal/zzalh$zza;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzalh$zza;

    const-string/jumbo v1, "CHILD_REMOVED"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzalh$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhv:Lcom/google/android/gms/internal/zzalh$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzalh$zza;

    const-string/jumbo v1, "CHILD_ADDED"

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/zzalh$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhw:Lcom/google/android/gms/internal/zzalh$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzalh$zza;

    const-string/jumbo v1, "CHILD_MOVED"

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/internal/zzalh$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhx:Lcom/google/android/gms/internal/zzalh$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzalh$zza;

    const-string/jumbo v1, "CHILD_CHANGED"

    invoke-direct {v0, v1, v5}, Lcom/google/android/gms/internal/zzalh$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhy:Lcom/google/android/gms/internal/zzalh$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzalh$zza;

    const-string/jumbo v1, "VALUE"

    invoke-direct {v0, v1, v6}, Lcom/google/android/gms/internal/zzalh$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/google/android/gms/internal/zzalh$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhv:Lcom/google/android/gms/internal/zzalh$zza;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhw:Lcom/google/android/gms/internal/zzalh$zza;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhx:Lcom/google/android/gms/internal/zzalh$zza;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhy:Lcom/google/android/gms/internal/zzalh$zza;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    aput-object v1, v0, v6

    sput-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhA:[Lcom/google/android/gms/internal/zzalh$zza;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/zzalh$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhA:[Lcom/google/android/gms/internal/zzalh$zza;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzalh$zza;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzalh$zza;

    return-object v0
.end method
