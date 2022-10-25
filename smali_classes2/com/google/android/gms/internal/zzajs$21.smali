.class Lcom/google/android/gms/internal/zzajs$21;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bdc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

.field final synthetic bex:J


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;JLcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$21;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$21;->bdc:Lcom/google/android/gms/internal/zzajq;

    iput-wide p3, p0, Lcom/google/android/gms/internal/zzajs$21;->bex:J

    iput-object p5, p0, Lcom/google/android/gms/internal/zzajs$21;->bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzbp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$21;->bdZ:Lcom/google/android/gms/internal/zzajs;

    const-string/jumbo v2, "setValue"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$21;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$21;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzajs$21;->bex:J

    iget-object v4, p0, Lcom/google/android/gms/internal/zzajs$21;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;JLcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$21;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$21;->bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$21;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V

    return-void
.end method
