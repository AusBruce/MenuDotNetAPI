
namespace RedMango_API.Services
{
    public class BlobService : IBlobService
    {
        public Task<bool> DeleteBlob(string blobName, string containerName)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetBlob(string blobName, string containerName)
        {
            throw new NotImplementedException();
        }

        public Task<string> UploadBlob(string blobName, string containerName, IFormFile file)
        {
            throw new NotImplementedException();
        }
    }
}
